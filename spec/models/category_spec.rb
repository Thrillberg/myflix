require 'spec_helper'

describe Category do
  it { should have_many(:videos)}

  describe "#recent_videos" do
  
  it "returns an empty array if the category does not have any videos" do
    comedies = Category.create(name: "comedies")
    expect(comedies.recent_videos).to eq([])
  end

  it "returns an array of videos in reverse chronological order" do
    comedies = Category.create(name: "comedies")
    futurama = Video.create(title: "Futurama", description: "Space Travel!", category: comedies, created_at: 1.day.ago)
    back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel!", category: comedies)
    expect(comedies.recent_videos).to eq([back_to_the_future, futurama])
  end

  it "returns an array of all videos if there are fewer than six total" do
    comedies = Category.create(name: "comedies")
    futurama = Video.create(title: "Futurama", description: "Space Travel!", category: comedies, created_at: 1.day.ago)
    back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel!", category: comedies)
    expect(comedies.recent_videos.count).to eq(2)
  end

  it "returns the most recent 6 videos" do
    comedies = Category.create(name: "comedies")
    6.times { Video.create(title: "foo", description: "bar", category: comedies)}
    tonights_show = Video.create(title: "Tonights show", description: "talk show", category: comedies, created_at: 1.day.ago)
    expect(comedies.recent_videos).not_to include(tonights_show)
  end


  it "returns 6 videos if there ar more than 6 videos" do
    comedies = Category.create(name: "comedies")
    7.times { Video.create(title: "foo", description: "bar", category: comedies)}
    expect(comedies.recent_videos.count).to eq(6)
  end
end
end