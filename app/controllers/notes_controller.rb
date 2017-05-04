class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.approved = false

    respond_to do |format|
      if @note.save
        format.html { redirect_to drinks_by_name_path(@note.drink_id), notice: 'Note was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
    
  def update
    if @note.update(note_params) && current_user.id == @note.user_id
      redirect_to drinks_by_name_path(@note.drink_id), notice: 'Note was successfully updated.'
    else
      redirect_to drinks_by_name_path(@note.drink_id), alert: 'Note was not updated.'
    end
  end
  
  def destroy
    if @note.user_id == current_user.id
      @note.destroy
      redirect_to drinks_by_name_path(@note.drink_id), notice: 'Note was successfully deleted.'
    else
      redirect_to drinks_by_name_path(@note.drink_id), alert: 'Note was not deleted.'
    end
  end
  

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      if signed_in?
        params[:note].permit(:drink_id, :make_public, :message)
      end
    end
  
end
