class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  before_filter :require_admin
  def index
#    @books = Book.all
     @books = Book.paginate(:page => params[:page],
                                          :order => params[:sort],
                                          :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    load_data
    @book = Book.new

     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

     respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'El libro fue creado satisfactoriamente.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        load_data
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'El libro fue actualizado satisfactoriamente.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end
end

private
def load_data
@authors = Author.find(:all)
@publishers = Publisher.find(:all)

end

