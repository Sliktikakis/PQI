class UsagersController < ApplicationController
  before_action :logged_in_user,  only: [:show, :index, :create, :edit, :update, :destroy, :pqi]
  before_action :admin_user,      only: :destroy

  def index
    @villes = [ ["Aubervilliers", "Aubervilliers"],
                ["Aulnay-sous-Bois", "Aulnay-sous-Bois"],
                ["Bagnolet", "Bagnolet"],
                ["Bobigny", "Bobigny"],
                ["Bondy", "Bondy"],
                ["Clichy-sous-Bois", "Clichy-sous-Bois"],
                ["Coubron", "Coubron"],
                ["Drancy", "Drancy"],
                ["Dugny", "Dugny"],
                ["Epinay-sur-Seine", "Epinay-sur-Seine"],
                ["Gagny", "Gagny"],
                ["Gournay-sur-Marne", "Gournay-sur-Marne"],
                ["L'Ile-Saint-Denis", "L'Ile-Saint-Denis"],
                ["La Courneuve", "La Courneuve"],
                ["La Plaine Saint-Denis", "La Plaine Saint-Denis"],
                ["Le Blanc-Mesnil", "Le Blanc-Mesnil"],
                ["Le Bourget", "Le Bourget"],
                ["Le Pré-Saint-Gervais", "Le Pré-Saint-Gervais"],
                ["Le Raincy", "Le Raincy"],
                ["Les Lilas", "Les Lilas"],
                ["Les Pavillons-sous-Bois", "Les Pavillons-sous-Bois"],
                ["Livry-Gargan", "Livry-Gargan"],
                ["Montfermeil", "Montfermeil"],
                ["Montreuil", "Montreuil"],
                ["Neuilly-Plaisance", "Neuilly-Plaisance"],
                ["Neuilly-sur-Marne", "Neuilly-sur-Marne"],
                ["Noisy-le-Grand", "Noisy-le-Grand"],
                ["Noisy-le-Sec", "Noisy-le-Sec"],
                ["Pantin", "Pantin"],
                ["Pierrefitte", "Pierrefitte"],
                ["Romainville", "Romainville"],
                ["Rosny-sous-Bois", "Rosny-sous-Bois"],
                ["Saint-Denis", "Saint-Denis"],
                ["Saint-Ouen", "Saint-Ouen"],
                ["Sevran", "Sevran"],
                ["Stains", "Stains"],
                ["Tremblay-en-France", "Tremblay-en-France"],
                ["Vaujours", "Vaujours"],
                ["Villemomble", "Villemomble"],
                ["Villepinte", "Villepinte"],
                ["Villetaneuse", "Villetaneuse"]]
  	if logged_in?
      @usager = Usager.new
      @usagers = Usager.paginate(page: params[:page], per_page: 50)
      if params[:search]
        @usagers = Usager.search(params[:search]).order("nom ASC").paginate(page: params[:page], per_page: 50)
      end
  	else
  	  redirect_to root_url
  	end
  end

  def show
  	@usager = Usager.find(params[:id])
  end

  def create
    @usager = Usager.new(usager_params)
    @usager.user_id = current_user.id
    if @usager.save
      flash[:success] = "Nouvel usager ajouté !"
      redirect_to id_rencontre_path(:id => @usager.id)
    else
      flash[:danger] = "Ajoutez au moins le nom ou le prénom de l'usager ! Si ils ne sont pas connus, spécifiez 'Inconnu' pour le nom. Il faut également renseigner son sexe et sa ville."
      redirect_to usagers_path
    end
  end

  def edit
    @villes = [ ["Aubervilliers", "Aubervilliers"],
                ["Aulnay-sous-Bois", "Aulnay-sous-Bois"],
                ["Bagnolet", "Bagnolet"],
                ["Bobigny", "Bobigny"],
                ["Bondy", "Bondy"],
                ["Clichy-sous-Bois", "Clichy-sous-Bois"],
                ["Coubron", "Coubron"],
                ["Drancy", "Drancy"],
                ["Dugny", "Dugny"],
                ["Epinay-sur-Seine", "Epinay-sur-Seine"],
                ["Gagny", "Gagny"],
                ["Gournay-sur-Marne", "Gournay-sur-Marne"],
                ["L'Ile-Saint-Denis", "L'Ile-Saint-Denis"],
                ["La Courneuve", "La Courneuve"],
                ["La Plaine Saint-Denis", "La Plaine Saint-Denis"],
                ["Le Blanc-Mesnil", "Le Blanc-Mesnil"],
                ["Le Bourget", "Le Bourget"],
                ["Le Pré-Saint-Gervais", "Le Pré-Saint-Gervais"],
                ["Le Raincy", "Le Raincy"],
                ["Les Lilas", "Les Lilas"],
                ["Les Pavillons-sous-Bois", "Les Pavillons-sous-Bois"],
                ["Livry-Gargan", "Livry-Gargan"],
                ["Montfermeil", "Montfermeil"],
                ["Montreuil", "Montreuil"],
                ["Neuilly-Plaisance", "Neuilly-Plaisance"],
                ["Neuilly-sur-Marne", "Neuilly-sur-Marne"],
                ["Noisy-le-Grand", "Noisy-le-Grand"],
                ["Noisy-le-Sec", "Noisy-le-Sec"],
                ["Pantin", "Pantin"],
                ["Pierrefitte", "Pierrefitte"],
                ["Romainville", "Romainville"],
                ["Rosny-sous-Bois", "Rosny-sous-Bois"],
                ["Saint-Denis", "Saint-Denis"],
                ["Saint-Ouen", "Saint-Ouen"],
                ["Sevran", "Sevran"],
                ["Stains", "Stains"],
                ["Tremblay-en-France", "Tremblay-en-France"],
                ["Vaujours", "Vaujours"],
                ["Villemomble", "Villemomble"],
                ["Villepinte", "Villepinte"],
                ["Villetaneuse", "Villetaneuse"]]
    @signalements = [ ["Signalement 115", "Signalement 115"],
                      ["Signalement tiers", "Signalement tiers"],
                      ["Croisé(e) en maraude", "Croisé(e) en maraude"]]
  	@usager = Usager.find(params[:id])
  end

  def update
    @villes = [ ["Aubervilliers", "Aubervilliers"],
                ["Aulnay-sous-Bois", "Aulnay-sous-Bois"],
                ["Bagnolet", "Bagnolet"],
                ["Bobigny", "Bobigny"],
                ["Bondy", "Bondy"],
                ["Clichy-sous-Bois", "Clichy-sous-Bois"],
                ["Coubron", "Coubron"],
                ["Drancy", "Drancy"],
                ["Dugny", "Dugny"],
                ["Epinay-sur-Seine", "Epinay-sur-Seine"],
                ["Gagny", "Gagny"],
                ["Gournay-sur-Marne", "Gournay-sur-Marne"],
                ["L'Ile-Saint-Denis", "L'Ile-Saint-Denis"],
                ["La Courneuve", "La Courneuve"],
                ["La Plaine Saint-Denis", "La Plaine Saint-Denis"],
                ["Le Blanc-Mesnil", "Le Blanc-Mesnil"],
                ["Le Bourget", "Le Bourget"],
                ["Le Pré-Saint-Gervais", "Le Pré-Saint-Gervais"],
                ["Le Raincy", "Le Raincy"],
                ["Les Lilas", "Les Lilas"],
                ["Les Pavillons-sous-Bois", "Les Pavillons-sous-Bois"],
                ["Livry-Gargan", "Livry-Gargan"],
                ["Montfermeil", "Montfermeil"],
                ["Montreuil", "Montreuil"],
                ["Neuilly-Plaisance", "Neuilly-Plaisance"],
                ["Neuilly-sur-Marne", "Neuilly-sur-Marne"],
                ["Noisy-le-Grand", "Noisy-le-Grand"],
                ["Noisy-le-Sec", "Noisy-le-Sec"],
                ["Pantin", "Pantin"],
                ["Pierrefitte", "Pierrefitte"],
                ["Romainville", "Romainville"],
                ["Rosny-sous-Bois", "Rosny-sous-Bois"],
                ["Saint-Denis", "Saint-Denis"],
                ["Saint-Ouen", "Saint-Ouen"],
                ["Sevran", "Sevran"],
                ["Stains", "Stains"],
                ["Tremblay-en-France", "Tremblay-en-France"],
                ["Vaujours", "Vaujours"],
                ["Villemomble", "Villemomble"],
                ["Villepinte", "Villepinte"],
                ["Villetaneuse", "Villetaneuse"]]
  	@usager = Usager.find(params[:id])
    if @usager.update_attribute(:derniere, params[:usager][:derniere]) && @usager.derniere
      if @usager.update_attribute(:signale, params[:usager][:signale]) && @usager.signale
        if !params[:usager][:signalement].empty?
          @usager.update_attribute(:signalement, params[:usager][:signalement])
          if @usager.dates_sig.nil?
            @usager.dates_sig = ""
          else
            @usager.dates_sig << " - "
          end
          @usager.dates_sig << @usager.derniere.strftime("%y/%m/%d")
          @usager.dates_sig << " (#{@usager.signalement})"
        else
          flash[:danger] = "Précisez le type de signalement"
          redirect_to id_rencontre_path(:id => @usager.id)
        end
      else
        params[:usager][:signalement] = nil
      end
      if @usager.rencontres.nil?
        @usager.rencontres = ""
      else
        @usager.rencontres << " - "
      end
      @usager.rencontres << @usager.derniere.strftime("%y/%m/%d")
      arr = @usager.rencontres.split(" - ").sort
      @usager.rencontres = arr.join(' - ')
      if @usager.pqi && @usager.pqi_histo.nil?
        @usager.pqi_histo = ""
        @usager.pqi_histo << Date.today.strftime("%d/%m/%y")
      end
      if (@usager.signale && !params[:usager][:signalement].empty?) || !@usager.signale
        @usager.update_attributes(usager_params)
        flash[:success] = "Rencontre ajoutée avec #{@usager.sexe} #{@usager.nom} #{@usager.prenom}"
        redirect_to usagers_path
      end
    elsif @usager.update_attribute(:pqi, params[:usager][:pqi])
      if @usager.update_attributes(usager_params)
        if @usager.pqi
          if @usager.pqi_histo
            @usager.pqi_histo << " ///// "
          else
            @usager.pqi_histo = ""
          end
        else
          @usager.pqi_histo << " - " unless @usager.pqi_histo.nil?
        end
        @usager.pqi_histo << Date.today.strftime("%d/%m/%y") unless @usager.pqi_histo.nil?
        @usager.update_attributes(usager_params)
        flash[:success] = "Usager édité"
        redirect_to @usager
      else
        flash[:danger] = "Mise à jour impossible. Veillez à remplir les informations nécessaires (Nom et/ou prénom, ville et sexe)."
        render 'edit'
      end
    elsif @usager.update_attributes(usager_params)
      flash[:success] = "Usager édité"
      redirect_to @usager
    else
      flash[:danger] = "Mise à jour impossible. Veillez à remplir les informations nécessaires (Nom et/ou prénom, ville et sexe)."
      render 'edit'
    end
  end

  def destroy
  	Usager.find(params[:id]).destroy
  	flash[:success] = "Usager supprimé"
  	redirect_to usagers_url
  end

  def pqi
    store_ville
    @villes = [ ["Aubervilliers", "Aubervilliers"],
                ["Aulnay-sous-Bois", "Aulnay-sous-Bois"],
                ["Bagnolet", "Bagnolet"],
                ["Bobigny", "Bobigny"],
                ["Bondy", "Bondy"],
                ["Clichy-sous-Bois", "Clichy-sous-Bois"],
                ["Coubron", "Coubron"],
                ["Drancy", "Drancy"],
                ["Dugny", "Dugny"],
                ["Epinay-sur-Seine", "Epinay-sur-Seine"],
                ["Gagny", "Gagny"],
                ["Gournay-sur-Marne", "Gournay-sur-Marne"],
                ["L'Ile-Saint-Denis", "L'Ile-Saint-Denis"],
                ["La Courneuve", "La Courneuve"],
                ["La Plaine Saint-Denis", "La Plaine Saint-Denis"],
                ["Le Blanc-Mesnil", "Le Blanc-Mesnil"],
                ["Le Bourget", "Le Bourget"],
                ["Le Pré-Saint-Gervais", "Le Pré-Saint-Gervais"],
                ["Le Raincy", "Le Raincy"],
                ["Les Lilas", "Les Lilas"],
                ["Les Pavillons-sous-Bois", "Les Pavillons-sous-Bois"],
                ["Livry-Gargan", "Livry-Gargan"],
                ["Montfermeil", "Montfermeil"],
                ["Montreuil", "Montreuil"],
                ["Neuilly-Plaisance", "Neuilly-Plaisance"],
                ["Neuilly-sur-Marne", "Neuilly-sur-Marne"],
                ["Noisy-le-Grand", "Noisy-le-Grand"],
                ["Noisy-le-Sec", "Noisy-le-Sec"],
                ["Pantin", "Pantin"],
                ["Pierrefitte", "Pierrefitte"],
                ["Romainville", "Romainville"],
                ["Rosny-sous-Bois", "Rosny-sous-Bois"],
                ["Saint-Denis", "Saint-Denis"],
                ["Saint-Ouen", "Saint-Ouen"],
                ["Sevran", "Sevran"],
                ["Stains", "Stains"],
                ["Tremblay-en-France", "Tremblay-en-France"],
                ["Vaujours", "Vaujours"],
                ["Villemomble", "Villemomble"],
                ["Villepinte", "Villepinte"],
                ["Villetaneuse", "Villetaneuse"]]
    @usagers = Usager.where(pqi: true, ville: session[:stored_ville]) unless session[:stored_ville] == "pqi"
    @ville_actuelle = session[:stored_ville]
    session.delete(:stored_ville)
  end

  def rencontre
    store_id
    @signalements = [ ["Signalement 115", "Signalement 115"],
                      ["Signalement tiers", "Signalement tiers"],
                      ["Croisé(e) en maraude", "Croisé(e) en maraude"]]
    @usager = Usager.find_by(id: session[:stored_id])
    session.delete(:stored_id)
  end


  private
    def usager_params
      params.require(:usager).permit( :nom,
                                      :prenom,
                                      :sexe,
                                      :ville,
                                      :adresse,
                                      :adresse_précis,
                                      :date_naissance,
                                      :tel,
                                      :notes,
                                      :pqi,
                                      :derniere,
                                      :rencontres,
                                      :signalement,
                                      :signale,
                                      :dates_sig,
                                      :pqi_histo)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Merci de vous connecter."
        redirect_to root_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end