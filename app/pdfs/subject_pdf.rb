class SubjectPdf < Prawn::Document

  def initialize(subject, students)
    super(top_margin: 50)
    @subject = subject
    @students = students
    text "Subject: #{@subject.name}", size: 30, style: :bold
    print_date
    line_items
  end

  def line_items
    move_down 50
    table line_item_rows do
      row(0).font_style = :bold
      self.row_colors = ['DDDDDD', "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [["ID", "Name", "Grade"]] +
    @students.each.map do |s|
      [s.user.id, s.user.email, s.get_graeds_from_subject(@subject.id)]
    end
  end

  def print_date
    move_down 20
    text "Printed: #{DateTime.now.to_formatted_s(:db)}"
  end


end