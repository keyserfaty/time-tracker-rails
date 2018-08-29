namespace :notification do
  desc "Sends SMS notifications to employees asking them to log overtime"
  task sms: :environment do
    # schedule to run every sunday at 5pm
    # iterate over all employees 
    # skip adminusers
    # send a msg that has instructions and a link
    def set_msg (user) 
      "Hi #{user.first_name}, please click this link:"
    end

    User.all.each do |user| 
      SmsTool.send_sms(user.phone_num, set_msg(user))
    end
  end

end
