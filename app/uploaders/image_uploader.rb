require "shrine"
require "shrine/storage/file_system"

# stockage local pour développement
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("storage", prefix: "cache"), # fichiers temporaires
  store: Shrine::Storage::FileSystem.new("storage", prefix: "store")  # fichiers finaux
}

class ImageUploader < Shrine
  plugin :activerecord           # Intégration avec ActiveRecord
  plugin :cached_attachment_data # Permet de garder l'image dans le formulaire en cas d'erreur
  plugin :validation_helpers     # Plugin pour valider les fichiers

  # ✅ Valider l'image
  Attacher.validate do
    validate_max_size 5*1024*1024, message: "is too large (max 5 MB)"
    validate_mime_type_inclusion ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  end
end
