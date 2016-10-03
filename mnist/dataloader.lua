local mnist = require 'mnist'

if DataLoader == nil then -- prevent redefinition when using in iTorch
  local DataLoader = torch.class('DataLoader')
end

function DataLoader:__init(opts)
  self.batchSize = opts.batchSize

  self.data = {
    train = mnist.traindataset(),
    val = mnist.testdataset()
  }

  for partition, _ in pairs(self.data) do
    self.data[partition].label:add(1) -- lua is 1-indexed!
  end
end

function DataLoader:size(partition)
  return self.data[partition].label:size(1)
end

function DataLoader:run(partition)
  partition = partition or 'train' -- default arguments, lua style

  local data = self.data[partition]     -- TODO: the data for the selected partition
  local perm = torch.randperm(self:size(partition)):long()      -- TODO: LongTensor containing rand perm of  [1..data.size]
  local batchSize = self.batchSize -- TODO: the batch size, configured in __init

  local permImages = data.data:index(1, perm)
  local permLabels = data.label:index(1, perm)

  local n = 0 -- the minibatch number
  local function loadData()
    local startIdx = n*batchSize+1

    if startIdx > data.size then
      return nil
    end

    local endIdx = math.min((n+1)*batchSize, data.size)

    local mbImages = permImages[{{startIdx,endIdx},{},{}}] -- TODO: a Tensor containing a minibatch of images
    local mbLabels = permLabels[{{startIdx,endIdx}}] -- TODO: a Tensor containing the labels for to each image

    local minibatch = {
      images = mbImages:view(mbImages:size(1), 1, 28, 28), -- view as greyscale image
      labels = mbLabels,
    }

    n = n + 1

    return n, minibatch
  end

  return loadData
end
