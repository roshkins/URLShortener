class Shortener

  def initialize(email)
    #sets current user
    @user = User.find_by_email(email)
    if @user.nil?
      usrnme = prompt_for_username
      @user = User.create!(:username => usrnme, :email => email)
    end
  end

  def prompt_for_username
    puts "What username do you want?"
    gets.chomp
  end

  def shorten(long_url)
    #returns short_url
    ShortUrl.shorten(long_url, @user)
  end

  def expand(short_url)
   long_url = ShortUrl.expand(short_url, @user)
   comments = ShortUrl.comments(short_url)
   comments.each do |comment|
     puts "#{comment.user.username} said: #{comment.comment}"
   end
   Launchy.open(long_url)
  end

  def comment_on(short_url, comment)
    ShortUrl.comment_on(short_url, @user, comment)
  end

  def tag(short_url, tag)
    ShortUrl.tag(short_url, tag)
  end
end