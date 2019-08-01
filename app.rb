require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/author.rb')
require('./lib/book.rb')
require('./lib/patron.rb')
require('pry')
require('pg')

DB = PG.connect({:dbname => "library"})

    # Landing page and author paths------------------->

    get('/') do
      erb(:library)
    end

    get('/library') do
      redirect("/")
    end

    get('/authors') do
        @authors = Author.all
      erb(:authors)
    end

    get('/authors/new') do
      erb(:new_author)
    end

    post('/authors') do
      name = params[:author_name]
      author = Author.new({:name => name, :id => nil})
      author.save()
      redirect to('/authors')
    end

    get('/authors/:id') do
      @author = Author.find(params[:id].to_i())
      erb(:author)
    end

    get('/authors/:id/edit') do
      @author = Author.find(params[:id].to_i())
      erb(:edit_author)
    end

    patch('/authors/:id') do
      @author = Author.find(params[:id].to_i())
      @author.update(params[:name])
      redirect to('/authors')
    end

    delete('/authors/:id') do
      @author = Author.find(params[:id].to_i())
      @author.delete()
      redirect to('/authors')
    end

    # Book paths ---------------------->

    get('/books') do
      @books = Book.all()
      erb(:books)
    end

    get('/books/new') do
      erb(:new_book)
    end

    get('/books/:id') do
      @book = Book.find(params[:id].to_i())
      erb(:book)
    end

    get('/books/:id/edit') do
      @book = Book.find(params[:id].to_i())
      erb(:edit_book)
    end

    patch('/books/:id') do
      @book = Book.find(params[:id].to_i())
      @book.update(params[:title])
      redirect to('/books')
    end

    delete('/books/:id') do
      @book = Book.find(params[:id].to_i())
      @book.delete()
      redirect to('/books')
    end

    post('/books') do
      title = params[:book_title]

      book = Book.new({:title => title, :id => nil})
      book.save()
      redirect to('/books')
    end
#-------------patron paths below-------------------

    get('/patrons') do
      @patrons = Patron.all()
      erb(:patrons)
    end

    get('/patrons/new') do
      erb(:new_patron)
    end

    get('/patrons/:id') do
      @patron = Patron.find(params[:id].to_i())
      erb(:patron)
    end

    get('/patrons/:id/edit') do
      @patron = Patron.find(params[:id].to_i())
      erb(:edit_patron)
    end

    post('/patrons') do
      name = params[:patron_name]
      phone = params[:patron_phone]
      patron = Patron.new({:name => name, :phone => phone, :id => nil})
      patron.save()
      redirect to('/patrons')
    end

    patch('/patrons/:id') do
      @patron = Patron.find(params[:id].to_i())
      @patron.update(params[:edit_patron_name], params[:edit_patron_phone])
      redirect to('/patrons')
    end

    delete('/patrons/:id') do
      @patron = Patron.find(params[:id].to_i())
      @patron.delete()
      redirect to('/patrons')
    end


    # get('/albums/new') do
    #   'This will take us to a page with a form for adding a new album.'
    # end

    # get('/albums/:id') do
    #   'This route will show a specific album based on its ID. The value of ID here is '
    # end

    # post('/albums') do
    #   'This route will add an album to our list of albums. We cant access this by typing in the URL. In a future lesson, we will use a form that specifies a POST action to reach this route.'
    # end
    #
    # get('/albums/:id/edit') do
    #   'This will take us to a page with a form for updating an album with an ID of.'
    # end
    #
    # patch('/albums/:id') do
    #   'This route will update an album. We cant reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route.'
    # end
    #
    # delete('/albums/:id') do
    #   'This route will delete an album. We cant reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route.'
    # end
    #
    # get('/custom_route') do
    #   'We can even create custom routes, but we should only do this when needed.'
    # end
