RSpec.describe "Main menu" do

  before do
    @user = User.create(name: "chuckeles", email: "me@chuckeles.me", password: "foobaaaz", password_confirmation: "foobaaaz")
  end

  let :login do
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "has a link to about" do
    visit root_path

    click_link "About"

    expect(page).to have_current_path(about_path)
  end

  it "has a link to login" do
    visit root_path

    click_link "Log in"

    expect(page).to have_current_path(new_user_session_path)
  end

  it "has a link to signup" do
    visit root_path

    click_link "Sign up"

    expect(page).to have_current_path(new_user_registration_path)
  end

  it "has profile and logout links and does not have signup and login links when a user is logged in" do
    login
    visit root_path

    expect(page).to have_content("Profile")
    expect(page).to have_content("Log out")
    expect(page).to_not have_content("Sign up")
    expect(page).to_not have_content("Log in")
  end


  it "has a link to logged user's profile" do
    login
    visit root_path

    click_link "Profile"

    expect(page).to have_current_path(user_path(@user))
  end

  it "has a logout link that logs the user out" do
    login
    visit root_path

    click_link "Log out"

    expect(page).to have_content("Log in")
    expect(page).to_not have_content("Log out")
  end

end