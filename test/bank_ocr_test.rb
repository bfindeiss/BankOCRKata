# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'bank_ocr'

class BankOCRTest < Test::Unit::TestCase

  def setup
    @ocr = BankOCR.new
  end
  def test_foo
    assert_equal "123456789",
@ocr.convert("    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|")
    end
end
