marks = {"Ramesh" => 23, "Vivek" => 40, "Harsh" => 88, "Mohammad" => 60}

def group_by_marks(marks, pass_marks)
  marks.group_by { |key, value| value > pass_marks ? :Passed : :Failed }
end

p group_by_marks(marks, 30)


