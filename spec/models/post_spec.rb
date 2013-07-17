require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    post = Post.new(title: "new post!", content: "cool story, bro")
    expect { post.save }.to change { post.title }.from("new post!").to("New Post!")
  end

  it "post should be unpublished by default" do
    expect(Post.new(title: "new post!", content: "cool story, bro").is_published?).to eq false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
