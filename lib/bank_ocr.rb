class BankOCR
  def initialize
    @literals = [{"   "=>[1,4]," _ "=>[2,3,5,6,7,8,9]},{" _|"=>[2,3],"|_|"=>[4,8,9],"|_ "=>[5,6],"  |"=>[1,7]},{" _|"=>[3,5,9],"|_|"=>[6,8],"|_ "=>[2],"  |"=>[1,4,7]},["\n"]]
    @result=[[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9]]
  end

  def readlines ocrString
    @lines = ocrString.split("\n")
  end

  def convert_number
    @lines.each_with_index{|cur_line,line_nr|
      literals = @literals[line_nr]
      nums_in_line=cur_line.scan(/.{1,3}/m)
      nums_in_line.each_with_index{ |string,digit_nr|
        @result[digit_nr]=@result[digit_nr]&literals[string]
      }
    }
    return @result.to_s
  end
  def convert ocrString
    readlines ocrString
    return convert_number
  end
end