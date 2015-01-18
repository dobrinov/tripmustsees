require "rails_helper"

describe ApplicationHelper do
  describe "#head_javascript_includes" do
    let(:additional_scripts) { (1..10).to_a.map { |i| {scr: "script_#{i}"} } }

    it "renders javascript_include_tag" do
      allow(helper).to receive(:additional_head_javascripts).and_return(additional_scripts)

      expect(helper).to receive(:javascript_include_tag).exactly(additional_scripts.size).times
      helper.head_javascript_includes
    end
  end

  describe "#body_javascript_includes" do
    let(:additional_scripts) { (1..10).to_a.map { |i| {scr: "script_#{i}"} } }

    it "renders javascript_include_tag" do
      assign(:_additional_body_javascripts, (1..10).to_a.map { |i| {scr: "script_#{i}"} })

      expect(helper).to receive(:javascript_include_tag).exactly(additional_scripts.size).times
      helper.body_javascript_includes
    end
  end

  describe "#random_landingpage_image" do
    it "returns a String" do
      expect(helper.random_landingpage_image).to be_a(String)
    end
  end
end
