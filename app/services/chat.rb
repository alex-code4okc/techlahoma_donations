require 'slack-notifier'

class Chat

  def self.slack_message(message)
    Rails.logger.debug "CHAT: #{message}"
    return if ENV["SLACK_URL"].blank?
      notifier = regularteam
      notifier.ping Slack::Notifier::Util::LinkFormatter.format(message)
  end

    private
    def self.regularteam
      Slack::Notifier.new ENV["SLACK_URL"],
                                  channel: '#membership-drive', username: 'DonationBot'
    end
end


##<Net::HTTPOK 200 OK readbody=true>
