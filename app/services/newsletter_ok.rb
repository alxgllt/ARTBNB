class NewsletterOk

  def initialize
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def run(params)
    @gibbon.lists(@list_id).members.create(
          body: {
            email_address: params[:email],
            status: "subscribed"
            # merge_fields: {
            #   FNAME: @user.first_name,
            #   LNAME: @user.last_name
            # }
          }
        )
  end
end
