class UsersDatatable
  delegate :params, :h, :link_to, :raw, :edit_director_user_path, :director_user_path, :number_to_currency,  to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: User.count,
        iTotalDisplayRecords: users.total_entries,
        aaData: data
    }
  end


  private

  def data
    users.map do |user|
      [
          user.email,
          if user.roles.present?
            user.roles.first.name
          else
            ''
          end ,
          link_to(raw(' <i class="fa fa-pencil-square-o"></i> '), edit_director_user_path(user)) + link_to(raw(' <i class="fa fa-trash-o"></i> '), director_user_path(user), :method => :delete, data: { confirm: 'Are you sure?' })
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:sSearch].present?
      subjects = users.where("email like :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[email]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end