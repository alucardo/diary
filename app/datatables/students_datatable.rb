class StudentsDatatable < UsersDatatable
  delegate  :edit_director_student_path, :director_student_path, to: :@view



  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: User.students.count,
        iTotalDisplayRecords: users.students.total_entries,
        aaData: data
    }
  end


  protected

  def data
    users.map do |user|
      [
          user.email,
          if user.roles.present?
            user.roles.first.name
          else
            ''
          end ,
          link_to(raw('<i class="fa fa-search"></i>'), director_student_path(user) ) + link_to(raw(' <i class="fa fa-pencil-square-o"></i> '), edit_director_student_path(user)) + link_to(raw(' <i class="fa fa-trash-o"></i> '), director_student_path(user), :method => :delete, data: { confirm: 'Are you sure?' })
      ]
    end
  end


  def fetch_users
    users = User.students.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:sSearch].present?
      users = users.where("email like :search", search: "%#{params[:sSearch]}%")
    end
    users
  end



end