module Main where

-- ���i�h�x�[�X�̕���iPar�j���s���\�ɂ��郂�W���[��
import Control.Monad.Par (spawnP, get, runPar)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    let (n:_) = fmap read args
    print (parallelFib n)
    putStrLn "DONE"

-- �t�B�{�i�b�`�������Ōv�Z����
-- Par���i�h�ɂ����ivar1��ivar2�̑g�Aresult1��result2�̑g������ɋ��߂���
parallelFib :: Int -> Int
parallelFib 0 = 0
parallelFib 1 = 1
parallelFib n = runPar $ do
    ivar1 <- spawnP $ fib (n - 1)
    ivar2 <- spawnP $ fib (n - 2)
    result1 <- get ivar1
    result2 <- get ivar2
    return $ result1 + result2

-- �i�C�[�u�ȃt�B�{�i�b�`���̌v�Z�B������A���ɕ��񐫂��ӎ����Ă��Ȃ�
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
