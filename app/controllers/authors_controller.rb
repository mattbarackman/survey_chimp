class AuthorsController < ApplicationController
  has_many :surveys
  has_secure_password
end