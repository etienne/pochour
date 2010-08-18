require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  should "output a <time> tag with the given date" do
    assert_equal('<time datetime="2010-08-30">30 août 2010</time>', publication_date(Time.local(2010, 8, 30)))
  end
end
