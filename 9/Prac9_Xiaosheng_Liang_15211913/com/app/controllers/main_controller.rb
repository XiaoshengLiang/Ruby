class MainController < ApplicationController
    
  def welcome
      @message="Welcome"
  end

  def goodbye
      @message="Goodbye"
  end

  def input
      @id=params[:id]
      @entry = Entry.create({:id =>  @id})
  end

  def show
      @person=Entry.last
      @id    =@person.id
       end
end
