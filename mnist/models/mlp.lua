function mlp(opt)
  -- Returns a Module that takes an Nx1x28x28 Tensor and produces a Nx10 Tensor

  local nPixels = opt.imgSize * opt.imgSize
  local nClasses = opt.nClasses
	model = nn.Sequential()
	model:add(nn.View(nPixels))
	model:add(nn.Linear(nPixels, 1000))
	model:add(nn.ReLU())
	model:add(nn.Linear(1000, 500))
	model:add(nn.ReLU())
	model:add(nn.Linear(500, 100))
	model:add(nn.ReLU())
	model:add(nn.Linear(100, nClasses))

  return model
end

return mlp
