class BookingObserver < ActiveRecord::Observer
  def after_update(record)
  # use the MyLogger instance method to retrieve the single instance/object of the class
  @logger = MyLogger.instance
  # use the logger to log/record a message about the updated car
  @logger.logInformation("###############Observer Demo:#")
  @logger.logInformation("+++ BookingObserver: The booking for
      #{record.user.username} has been updated to:
      - Cut: #{record.cut}
      - Wash: #{record.wash}
      - Colour #{record.colour} ")
    @logger.logInformation("##############################")
  end
end
