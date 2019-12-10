{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
module Lib
    ( startApp
    , app
    ) where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

data User = User
  { userId        :: Int
  , userFirstName :: String
  , userLastName  :: String
  } deriving (Eq, Show)
  
$(deriveJSON defaultOptions ''User)

data GameBoard = GameBoard
	{map :: [Int]
	} deriving (Eq,Show)

$(deriveJSON defaultOptions ''GameBoard)

type API = "users" :> Get '[JSON] [User]
	:<|> "game" :> Get '[JSON] GameBoard

startApp :: IO ()
startApp = run 8080 app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = return users 
	:<|> return game

users :: [User]
users = [ User 1 "Isaac" "Newton"
        , User 2 "Albert" "Einstein"
        ]
game :: GameBoard
game =  GameBoard [1,2,3,4,5]
	   