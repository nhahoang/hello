class AuthorMailer < ActionMailer::Base
  default from: "rubyonrails1905@gmail.com"

  def deleted_books(author)
    @author = author
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    @url = 'http://localhost:3000/login'
    mail(:to => @author.email, subject: "Delete Book")
  end
end
