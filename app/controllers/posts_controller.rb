class PostsController < ApplicationController

      def index
            @posts = Post.all
      end

       def new
            @post = Post.new
      end

      def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        @post.expired = @post.created_at + 7 * 60*60*24
        @post.save
        redirect_to root_path
      end

      private

        def post_params
          params.require(:post).permit(:post_content)
        end
end
