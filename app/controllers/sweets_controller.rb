class SweetsController < ApplicationController
  before_action :authenticate_user!

  def index
   
    if params[:search] == nil
      @sweets= Sweet.all
    elsif params[:search] == ''
      @sweets= Sweet.all
    else
      @sweets = Sweet.where("about LIKE ? ",'%' + params[:search] + '%')
      @sweets = Sweet.where("name LIKE ? ",'%' + params[:search] + '%')
    end
  end

 def search
   if params[:search] == nil
    @sweets= Sweet.all
   elsif params[:search] == ''
    @sweets= Sweet.all
   else
    @sweets = Sweet.where("about LIKE ? ",'%' + params[:search] + '%')
    @sweets = Sweet.where("name LIKE ? ",'%' + params[:search] + '%')
   end
 end

def itiran
  @sweets= Sweet.all
end

    def new
      @sweet = Sweet.new
    end

      def create
        sweet = Sweet.new(sweet_params)

        sweet.user_id = current_user.id

        if sweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @sweet = Sweet.find(params[:id])
        @comments = @sweet.comments
        @comment = Comment.new
      end

      def edit
        @sweet = Sweet.find(params[:id])
      end

      def update
        sweet = Sost.find(params[:id])
        if sweet.update(sweet_params)
          redirect_to :action => “show”, :id => sweet.id
        else
          redirect_to :action => “new”
        end
      end
      def destroy
        sweet = Sweet.find(params[:id])
        sweet.destroy
        redirect_to action: :index
      end

      def spring
        @springs=Sweet.where(genre:"春")
      end
      
      def summer
        @summers=Sweet.where(genre:"夏")
      end
      
      def autumn
        @autumns=Sweet.where(genre:"秋")
      end

      def winter
        @winters=Sweet.where(genre:"冬")
      end

      private
      def sweet_params
        params.require(:sweet).permit(:image, :genre, :shashin, :name, :about, :url)
      end

  
    end


