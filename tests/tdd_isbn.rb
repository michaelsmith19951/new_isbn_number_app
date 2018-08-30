require "minitest/autorun"
require_relative "../isbn_functions.rb"

class TddIsbn < Minitest::Test



  def test_that_dash_is_removed
        assert_equal("12345", isbn_dash("1-2-3-4-5"))
        assert_equal("12345", isbn_dash("1 - 23-4 5"))
        assert_equal("12345", isbn_dash("1  -  2  -  3  -  4  -  5"))
    end
  def test_that_special_characters_are_valid
 		assert_equal(false, invalid_characters("0-321@14653-0"))
 		assert_equal(false, invalid_characters("877195x869"))
 		assert_equal(true, invalid_characters("877195869x"))
 	end
     def test_that_length_checker_works
        assert_equal(false, master_function("1234567"))
        assert_equal(false, master_function("1-2-3-4-5-6-7"))
        assert_equal(false, master_function("1 -2 -3 -4 -5 -6 -7 -"))
    end
     def test_that_10_works
        assert_equal(true, master_function("123456789X"))
        assert_equal(true, master_function("1- 23456  7-89x"))
        assert_equal(false, master_function("2 22222- - 222X"))
        assert_equal(false, master_function("1- 23B56  7-89x"))
    end
      def test_that_isbn10_check_works
        assert_equal(true, master_function("0471958697"))
        assert_equal(true, master_function("0-321-14653-0"))
        assert_equal(false, master_function("0-321-14133-0"))
        assert_equal(false, master_function("0-321-14133-8"))
        assert_equal(false, master_function("0-3218"))
    end
     def test_that_isbn13_check_works
        assert_equal(true, master_function("9780470059029"))
        assert_equal(false, master_function("2112322434556"))
        assert_equal(true, master_function("978-0-13-149505-0"))
        assert_equal(true, master_function("978 0 471 48648 0"))
        assert_equal(false, master_function("100 -200 43  221-2 2"))
    end
end