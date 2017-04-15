# frozen_string_literal: true

if Rails.env.development?
  [{
    id: 1,
    email: 'a@a',
    password: 'aaaaaa',
    password_confirmation: 'aaaaaa'
  },
  {
    id: 2,
    email: 'b@b',
    password: 'bbbbbb',
    password_confirmation: 'bbbbbb'
  }].each do |s|
    User.seed(s)
  end
end
