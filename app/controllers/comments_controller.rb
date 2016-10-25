class CommentsController < ApplicationController
    
    def index
        
    end
    
    def show
    
    end

    def new
    
    end
    
    def create
      @comment = Comment.new(comment_params)

      if @comment.save
        redirect_to customer_path(@comment.customer_id)
      else
        #バリデーションでエラーになった時にcustomers/show.html.erbを呼びます
        #customers/show.html.erbの中で@customerを参照しているので@customerを作成作成する必要になります。
        @customer = @comment.customer
        @comments = @customer.comments
    #   redirect_to customer_path(@comment.customer_id), flash: { error: @comment.errors.full_messages }
        render template: "customers/show"
      end
    end
    
    def edit
    
    end
    
    def update
    
    end

    def destroy
      @comment = Comment.find(params[:id])
      customer_id = @comment.customer_id
      @comment.destroy
      redirect_to customer_path(customer_id)
    end
    
    private
    
    def comment_params
      params.require(:comment).permit(:body, :customer_id)
    end


    
end
