class ContactsController < ApplicationController
  def new
    render text: "Make a new contact!"
  end

  def create
    render text: "Thank you for creating a new contact"
  end
end
