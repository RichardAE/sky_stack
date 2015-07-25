def login(user)
  fill_in  :user_email, with: user.email
  fill_in  :user_password, with: '12345'
  click_on 'Log in'
end
