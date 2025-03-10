{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module Arithmetic where
import qualified Prelude as Hs
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.DotProto as HsProtobufAST
import qualified Proto3.Suite.JSONPB as HsJSONPB
import Proto3.Suite.JSONPB ((.=), (.:))
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import qualified Proto3.Wire.Decode as HsProtobuf
       (Parser, RawField)
import qualified Control.Applicative as Hs
import Control.Applicative ((<*>), (<|>), (<$>))
import qualified Control.DeepSeq as Hs
import qualified Control.Monad as Hs
import qualified Data.ByteString as Hs
import qualified Data.Coerce as Hs
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.List.NonEmpty as Hs (NonEmpty(..))
import qualified Data.Map as Hs (Map, mapKeysMonotonic)
import qualified Data.Proxy as Proxy
import qualified Data.String as Hs (fromString)
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Enum as Hs
import qualified GHC.Generics as Hs
import qualified Google.Protobuf.Wrappers.Polymorphic as HsProtobuf
       (Wrapped(..))
import qualified Unsafe.Coerce as Hs
import Network.GRPC.HighLevel.Generated as HsGRPC
import Network.GRPC.HighLevel.Client as HsGRPC
import Network.GRPC.HighLevel.Server as HsGRPC hiding (serverLoop)
import Network.GRPC.HighLevel.Server.Unregistered as HsGRPC
       (serverLoop)
 
data Arithmetic request response = Arithmetic{arithmeticAdd ::
                                              request 'HsGRPC.Normal Arithmetic.TwoInts
                                                Arithmetic.OneInt
                                                ->
                                                Hs.IO (response 'HsGRPC.Normal Arithmetic.OneInt),
                                              arithmeticRunningSum ::
                                              request 'HsGRPC.ClientStreaming Arithmetic.OneInt
                                                Arithmetic.OneInt
                                                ->
                                                Hs.IO
                                                  (response 'HsGRPC.ClientStreaming
                                                     Arithmetic.OneInt)}
                                 deriving Hs.Generic
 
arithmeticServer ::
                   Arithmetic HsGRPC.ServerRequest HsGRPC.ServerResponse ->
                     HsGRPC.ServiceOptions -> Hs.IO ()
arithmeticServer
  Arithmetic{arithmeticAdd = arithmeticAdd,
             arithmeticRunningSum = arithmeticRunningSum}
  (ServiceOptions serverHost serverPort useCompression
     userAgentPrefix userAgentSuffix initialMetadata sslConfig logger
     serverMaxReceiveMessageLength serverMaxMetadataSize)
  = (HsGRPC.serverLoop
       HsGRPC.defaultOptions{HsGRPC.optNormalHandlers =
                               [(HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName "/arithmetic.Arithmetic/Add")
                                   (HsGRPC.convertGeneratedServerHandler arithmeticAdd))],
                             HsGRPC.optClientStreamHandlers =
                               [(HsGRPC.ClientStreamHandler
                                   (HsGRPC.MethodName "/arithmetic.Arithmetic/RunningSum")
                                   (HsGRPC.convertGeneratedServerReaderHandler
                                      arithmeticRunningSum))],
                             HsGRPC.optServerStreamHandlers = [],
                             HsGRPC.optBiDiStreamHandlers = [], optServerHost = serverHost,
                             optServerPort = serverPort, optUseCompression = useCompression,
                             optUserAgentPrefix = userAgentPrefix,
                             optUserAgentSuffix = userAgentSuffix,
                             optInitialMetadata = initialMetadata, optSSLConfig = sslConfig,
                             optLogger = logger,
                             optMaxReceiveMessageLength = serverMaxReceiveMessageLength,
                             optMaxMetadataSize = serverMaxMetadataSize})
 
arithmeticClient ::
                   HsGRPC.Client ->
                     Hs.IO (Arithmetic HsGRPC.ClientRequest HsGRPC.ClientResult)
arithmeticClient client
  = (Hs.pure Arithmetic) <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName "/arithmetic.Arithmetic/Add")))
      <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName "/arithmetic.Arithmetic/RunningSum")))
 
data TwoInts = TwoInts{twoIntsX :: Hs.Int32, twoIntsY :: Hs.Int32}
             deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance Hs.NFData TwoInts
 
instance HsProtobuf.Named TwoInts where
        nameOf _ = (Hs.fromString "TwoInts")
 
instance HsProtobuf.HasDefault TwoInts
 
instance HsProtobuf.Message TwoInts where
        encodeMessage _ TwoInts{twoIntsX = twoIntsX, twoIntsY = twoIntsY}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   twoIntsX),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   twoIntsY)])
        decodeMessage _
          = (Hs.pure TwoInts) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobufAST.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobufAST.Prim HsProtobufAST.Int32)
                (HsProtobufAST.Single "x")
                []
                ""),
             (HsProtobufAST.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobufAST.Prim HsProtobufAST.Int32)
                (HsProtobufAST.Single "y")
                []
                "")]
 
instance HsJSONPB.ToJSONPB TwoInts where
        toJSONPB (TwoInts f1 f2) = (HsJSONPB.object ["x" .= f1, "y" .= f2])
        toEncodingPB (TwoInts f1 f2)
          = (HsJSONPB.pairs ["x" .= f1, "y" .= f2])
 
instance HsJSONPB.FromJSONPB TwoInts where
        parseJSONPB
          = (HsJSONPB.withObject "TwoInts"
               (\ obj -> (Hs.pure TwoInts) <*> obj .: "x" <*> obj .: "y"))
 
instance HsJSONPB.ToJSON TwoInts where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON TwoInts where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema TwoInts where
        declareNamedSchema _
          = do let declare_x = HsJSONPB.declareSchemaRef
               twoIntsX <- declare_x Proxy.Proxy
               let declare_y = HsJSONPB.declareSchemaRef
               twoIntsY <- declare_y Proxy.Proxy
               let _ = Hs.pure TwoInts <*> HsJSONPB.asProxy declare_x <*>
                         HsJSONPB.asProxy declare_y
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "TwoInts",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("x", twoIntsX), ("y", twoIntsY)]}})
 
newtype OneInt = OneInt{oneIntResult :: Hs.Int32}
                 deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic)
 
instance Hs.NFData OneInt
 
instance HsProtobuf.Named OneInt where
        nameOf _ = (Hs.fromString "OneInt")
 
instance HsProtobuf.HasDefault OneInt
 
instance HsProtobuf.Message OneInt where
        encodeMessage _ OneInt{oneIntResult = oneIntResult}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   oneIntResult)])
        decodeMessage _
          = (Hs.pure OneInt) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
        dotProto _
          = [(HsProtobufAST.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobufAST.Prim HsProtobufAST.Int32)
                (HsProtobufAST.Single "result")
                []
                "")]
 
instance HsJSONPB.ToJSONPB OneInt where
        toJSONPB (OneInt f1) = (HsJSONPB.object ["result" .= f1])
        toEncodingPB (OneInt f1) = (HsJSONPB.pairs ["result" .= f1])
 
instance HsJSONPB.FromJSONPB OneInt where
        parseJSONPB
          = (HsJSONPB.withObject "OneInt"
               (\ obj -> (Hs.pure OneInt) <*> obj .: "result"))
 
instance HsJSONPB.ToJSON OneInt where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON OneInt where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema OneInt where
        declareNamedSchema _
          = do let declare_result = HsJSONPB.declareSchemaRef
               oneIntResult <- declare_result Proxy.Proxy
               let _ = Hs.pure OneInt <*> HsJSONPB.asProxy declare_result
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName = Hs.Just "OneInt",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("result", oneIntResult)]}})

