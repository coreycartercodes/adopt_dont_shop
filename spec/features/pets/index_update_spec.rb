require 'rails_helper'

RSpec.describe "When I visit a Pet Index page", type: :feature do
  it "can update a pet" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")

    pet_1 = shelter_1.pets.create(
                        name:   "Fido",
                        image:  "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg",
                        age:    "12",
                        sex:       "Male"
                      )

    visit "/pets/"

    expect(page).to have_content("Update Pet")

    click_link 'Update Pet'

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in 'name',  with:     "Sir Nubbington"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Sir Nubbington")
    expect(page).to have_content("12")
    expect(page).to have_content("Male")
    expect(page).to have_content("Adoptable")
  end
end
