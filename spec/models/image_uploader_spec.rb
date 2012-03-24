require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @article = FactoryGirl.create(:article)
    @uploader = ImageUploader.new(@article, :image)
    @original_file = File.join(%w(spec fixtures test_image.png))
    @uploader.store!(File.open(@original_file))
  end

  after do
    @uploader.remove!
  end
  
  # context 'the uploaded file' do
  #   it "should be identical to the original file" do
  #     @uploader.should be_identical_to(File.open(@original_file))
  #   end
  # end
  
  context 'the main version' do
    it "scales down an image to fit within 655 by 655 pixels" do
      @uploader.main.should be_no_larger_than(655, 655)
    end
  end

  context 'the thumb version' do
    it "scales down an image to be exactly 224 by 214 pixels" do
      @uploader.thumb.should have_dimensions(224, 214)
    end
  end

end