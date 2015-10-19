class CreateTorrents < ActiveRecord::Migration
  def change
    create_table :torrents do |t|
      t.string		:info_hash
      t.string		:name
      t.integer		:user_id
      t.string		:filename
      t.string		:original_filename
      t.text		:description
      t.integer		:category_id
      t.integer		:size
      t.integer		:piece_length
      t.integer		:pieces
      t.string		:orig_announce_url
      t.text		:orig_announce_list
      t.string		:created_by
      t.string		:torrent_comment
      t.integer		:numfiles
      t.integer		:views,				:default => 0
      t.integer		:times_completed,	:default => 0
      t.integer		:leechers,			:default => 0
      t.integer		:seeders,			:default => 0
      t.datetime	:created_at
      t.datetime	:updated_at
    end

    add_index :torrents, :info_hash

    create_table :torrent_files do |t|
      t.integer		:torrent_id
      t.text		:filename
      t.integer		:size
    end  

    create_table :peers do |t|
      t.integer		:torrent_id
      t.string		:peer_id
      t.integer		:port
      t.string		:passkey
      t.integer		:uploaded, :default => 0
      t.integer		:downloaded, :default => 0
      t.integer		:to_go, :default => 0
      t.boolean		:seeder, :default => false
      t.boolean		:connectable, :default => false
      t.integer		:user_id
      t.string		:agent
      t.datetime	:finished_at
      t.integer		:download_offset, :default => 0
      t.integer		:upload_offset, :default => 0
      t.datetime	:last_action_at
      t.datetime	:created_at
      t.datetime	:updated_at
    end
    add_index :peers, [:torrent_id, :peer_id], :unique => true
    add_index :peers, :connectable
  end
end
