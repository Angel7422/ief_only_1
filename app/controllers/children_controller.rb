class ChildrenController < ApplicationController
  before_action :set_child, only: %i[show edit update destroy]
  def index
    @children = Child.all
  end

  def create
    @child = Child.new(child_params)

    if @child.save
      redirect_to child_path(@child), notice: "Enfant créé avec succès !"
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @child = Child.new
  end

  def edit
  end

  def show
  end

  def update
    if @child.update(child_params)
      redirect_to child_path(@child), notice: "Les informations concernant votre enfant ont été mis à jour avec succès !"
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path, notice: "Les informations sur votre enfant ont été supprimées avec succès."
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:full_name, :birth_date, :cycle)
  end
 
end
