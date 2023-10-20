# app/controllers/events_controller.rb

class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create_event_a, :create_event_b]
  before_action :iterable_service, only: [:create_event_a, :create_event_b]

  def create_event_a
    event_response = @iterable_service.create_event(current_user.id, 'EventA')
    if event_response[:status]
      flash[:notice] = 'Event A created successfully!'
    else
      flash[:alert] = "Unable to create event A"
    end
    redirect_to root_path
  end

  def create_event_b
    event_response = @iterable_service.create_event(current_user.id, 'EventB')
    NotifyMailer.send_notify(current_user.email, "Event Created", 'Welcome to our event')
    if event_response[:status]
      flash[:notice] = 'Event B created successfully!'
    else
      flash[:alert] = "Unable to create event B"
    end
    redirect_to root_path
  end

  private

  def iterable_service
    @iterable_service = IterableService.new
  end

end