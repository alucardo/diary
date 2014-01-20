class ClassroomsDatatable
  delegate :params, :h, :link_to, :raw, :edit_director_classroom_path, :director_classroom_path, :number_to_currency,  to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: User.count,
        iTotalDisplayRecords: classrooms.total_entries,
        aaData: data
    }
  end

  private

  def data
    classrooms.map do |classroom|
      [
          classroom.name,
          link_to(raw('<i class="fa fa-search"></i>'), director_classroom_path(classroom)) + link_to(raw(' <i class="fa fa-pencil-square-o"></i> '), edit_director_classroom_path(classroom)) + link_to(raw(' <i class="fa fa-trash-o"></i> '), director_classroom_path(classroom), :method => :delete, data: { confirm: 'Are you sure?' })
      ]
    end
  end

  def classrooms
    @classrooms ||= fetch_classrooms
  end

  def fetch_classrooms
    classrooms = Classroom.order("#{sort_column} #{sort_direction}")
    classrooms = classrooms.page(page).per_page(per_page)
    if params[:sSearch].present?
      classrooms = classrooms.where("name like :search", search: "%#{params[:sSearch]}%")
    end
    classrooms
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