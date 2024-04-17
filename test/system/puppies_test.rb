require "application_system_test_case"

class PuppiesTest < ApplicationSystemTestCase
  setup do
    @puppy = puppies(:one)
  end

  test "visiting the index" do
    visit puppies_url
    assert_selector "h1", text: "Puppies"
  end

  test "should create puppy" do
    visit puppies_url
    click_on "New puppy"

    fill_in "Age", with: @puppy.age
    fill_in "Cuteness", with: @puppy.cuteness
    fill_in "Name", with: @puppy.name
    fill_in "Softness", with: @puppy.softness
    click_on "Create Puppy"

    assert_text "Puppy was successfully created"
    click_on "Back"
  end

  test "should update Puppy" do
    visit puppy_url(@puppy)
    click_on "Edit this puppy", match: :first

    fill_in "Age", with: @puppy.age
    fill_in "Cuteness", with: @puppy.cuteness
    fill_in "Name", with: @puppy.name
    fill_in "Softness", with: @puppy.softness
    click_on "Update Puppy"

    assert_text "Puppy was successfully updated"
    click_on "Back"
  end

  test "should destroy Puppy" do
    visit puppy_url(@puppy)
    click_on "Destroy this puppy", match: :first

    assert_text "Puppy was successfully destroyed"
  end
end
