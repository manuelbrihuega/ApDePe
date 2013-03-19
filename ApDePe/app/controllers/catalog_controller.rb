class CatalogController < ApplicationController
def index
    @page_title = "Catalogo de libros"
    @books = Book.paginate(:page => params[:page], 
			   :per_page => 10, 
                           :include => [:authors, :publisher], 
                           :order => params[:sort])
end    

# GET /catalog/1
# GET /catalog/1.json
def show
  @book = Book.find(params[:id])
end  

def search	
	@page_title = "Busqueda"
	search = Book.search(:include => [:publisher, :authors]) do
		keywords(params[:q])
		paginate(:page => params[:page])
      end
      @books = search.results
end

def latest
	@page_title = "Ultimos Libros"
	@books = Book.latest
	
end

end
