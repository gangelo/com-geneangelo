module EmailModule
  attr_accessor :from,
                :to,
                :cc,
                :bcc,
                :subject,
                :message_body

  def has_from?
    not @from.nil?
  end

  def has_to?
    not @to.nil?
  end

  def has_cc?
    not @cc.nil?
  end

  def has_bcc?
    not @bcc.nil?
  end

  def has_subject?
    not @subject.nil?
  end

  def has_message?
    not @message_body.nil?
  end
end