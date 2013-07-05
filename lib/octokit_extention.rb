module OctokitExtention
  def authenticated_api
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
  end
end
