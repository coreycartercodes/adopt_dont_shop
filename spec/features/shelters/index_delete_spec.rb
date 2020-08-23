require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see delete shelters" do
    shelter_1 = Shelter.create(name:       "New Hope Rescue",
                              address:     "208 Main St",
                              city:        "Denver",
                              state:       "CO",
                              zip:         "80329")


    visit "/shelters"

    expect(page).to have_content(shelter_1.name)

    click_link 'Delete Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(shelter_1.name)
    expect(page).to_not have_link('Delete Shelter')

  end
end
