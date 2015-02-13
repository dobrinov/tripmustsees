require "rails_helper"

describe ApplicationHelper do
  describe "#javascript_includes" do
    let(:additional_scripts) { (1..10).to_a.map { |i| {scr: "script_#{i}"} } }

    it "renders javascript_include_tag" do
      allow(helper).to receive(:additional_javascripts).and_return(additional_scripts)

      expect(helper).to receive(:javascript_include_tag).exactly(additional_scripts.size).times
      helper.javascript_includes
    end
  end


  describe "#random_landingpage_image" do
    it "returns a String" do
      expect(helper.random_landingpage_image).to be_a(String)
    end
  end

  describe "#website_online_year_range" do
    let(:current_year) { Time.now.year }

    context "when one year range" do
      let(:founded_year) { current_year }
      before { APP_CONFIG['founded_year'] = current_year }

      it "returns String" do
        expect(helper.website_online_year_range).to be_a(String)
      end

      it "returns only current year" do
        expect(helper.website_online_year_range).to eq("#{current_year}")
      end
    end

    context "when many year range" do
      let(:founded_year) { current_year - 1 }
      before { APP_CONFIG['founded_year'] = founded_year }

      it "returns String" do
        expect(helper.website_online_year_range).to be_a(String)
      end

      it "returns range" do
        expect(helper.website_online_year_range).to eq("#{founded_year} - #{current_year}")
      end
    end
  end
end
