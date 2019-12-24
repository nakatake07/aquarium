class InquireMailer < ApplicationMailer

def send_when_user_reply(buyer,inquire) #メソッドに対して引数を設定
	# binding.pry
	@buyer = buyer.user.name
    @mail = inquire.mail
    @user = inquire.name #里親になりたいユーザー情報
    @answer = inquire.body #里親になりたいユーザーからの内容
    mail to: buyer.user.email, subject: "あなたの投稿に対してユーザーから反応がありました"
end
end
