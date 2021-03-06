----------------------------------------------------------------------
-- This script downloads and loads the MNIST dataset
-- http://yann.lecun.com/exdb/mnist/
----------------------------------------------------------------------
print '==> downloading dataset'

-- Here we download dataset files. 

-- Note: files were converted from their original LUSH format
-- to Torch's internal format.

-- The SVHN dataset contains 3 files:
--    + train: training data
--    + test:  test data

tar = 'http://data.neuflow.org/data/mnist.t7.tgz'

if not paths.dirp('mnist.t7') then
   os.execute('wget ' .. tar)
   os.execute('tar xvf ' .. paths.basename(tar))
end

train_file = 'mnist.t7/train_32x32.t7'
test_file = 'mnist.t7/test_32x32.t7'

----------------------------------------------------------------------
print '==> loading dataset'

-- We load the dataset from disk, it's straightforward

trainData = torch.load(train_file,'ascii')
testData = torch.load(test_file,'ascii')

print('Training Data:')
print(trainData)
print()

print('Test Data:')
print(testData)
print()

----------------------------------------------------------------------
print '==> visualizing data'

-- Visualization is quite easy, using gfx.image().
gfx = require 'gfx.js'
gfx.image(trainData.data[{ {1,256} }], {legend='train'})
gfx.image(testData.data[{ {1,256} }], {legend='test'})
