require 'curb'
require 'configliere'
require 'uuid'

module ElVfsClient
  class ElFinderController < ActionController::Base
    respond_to :json, :html

    def show
      @root_path = root_path
      render :file => 'el_finder/layout', :layout => false
    end

    def run
      params.delete(:format)
      params.delete(:controller)
      params.delete(:action)

      c = Curl::Easy.new(url) do |curl|
        curl.headers['User-Agent'] = request.user_agent
        curl.headers['Accept'] = 'application/json'
        curl.headers['CLIENT_IP'] = request.env['HTTP_CLIENT_IP']
        curl.headers['X_FORWARDED_FOR'] = request.env['HTTP_X_FORWARDED_FOR']
        curl.headers['REMOTE_ADDR'] = request.env['REMOTE_ADDR']
        curl.multipart_form_post = true
      end

      if params['cmd'] == 'upload'
        upload = params.delete(:upload)
        parameters = params.map{ |key, value| Curl::PostField.content(key, value)}
        files = upload.map{ |file| Curl::PostField.file('upload[]', file.path, file.original_filename) }
        c.http_post(*parameters, *files)
      elsif params['cmd'] == 'put'
        parameters = params.map{ |key, value| Curl::PostField.content(key, value)}
        c.http_post(*parameters)
      else
        c.url << "?#{params.to_query}"
        c.http_get
      end

      respond_to do |format|
        format.html { render :json => c.body_str }
        format.json { render :json => c.body_str }
      end
    end

    private
      def url
        url = "#{Settings['vfs.url']}/api/el_finder/v2"
        url << params.delete(:root_path)
        return url
      end

      def root_path
        PathInterpolator.path(params)
      end
  end
end
