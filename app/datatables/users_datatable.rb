class UsersDatatable
  delegate :params, :h, :link_to, :raw, :edit_director_user_path, :director_user_path, :number_to_currency,  to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: User.count,
        iTotalDisplayRecords: subjects.total_entries,
        aaData: data
    }
  end
-
  private

  def data
    subjects.map do |subject|
      [
          subject.name,
          link_to(raw(' <i class="fa fa-pencil-square-o"></i> '), edit_director_subject_path(subject)) + link_to(raw(' <i class="fa fa-trash-o"></i> '), director_subject_path(subject), :method => :delete, data: { confirm: 'Are you sure?' })
      ]
    end
  end

  def subjects
    @subjects ||= fetch_subjects
  end

  def fetch_subjects
    subjects = Subject.order("#{sort_column} #{sort_direction}")
    subjects = subjects.page(page).per_page(per_page)
    if params[:sSearch].present?
      subjects = subjects.where("name like :search", search: "%#{params[:sSearch]}%")
    end
    subjects
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end