SelectDesign = (medium, size, user_id, simple_designer={simple_designer: false}, callback) ->
  props =
    medium: medium
    size: size
    simple_designer: simple_designer

  props.user_id = user_id if user_id

  modalSettings =
    modalClasses: 'modal-lg'
    modalStyles: {height: "80vh"}

  routineCallbacks =
    select: (design) ->
      callback design
    create: (sourceDesign) ->
      CreateDesign sourceDesign.id, user_id, simple_designer, (design) ->
        callback design
  console.log('routines props', props)
  console.log('routines routineCallbacks', routineCallbacks)

  new IframeModalLauncher('/components/select_design', props, routineCallbacks, modalSettings)


CreateDesign = (source_design_id, user_id, simple_designer={simple_designer: false}, callback) ->
  console.log("SOLIDUS_DESIGNS CREADTEDESIGN")
  console.log("SOLIDUS_DESIGNS callback", callback)
  props =
    design_id: source_design_id
    lablrSettings:
      admin: true
      simple_designer: simple_designer

  modalSettings =
    modalClasses: 'modal-lg'
    modalStyles: {height: "670px"}

  routineCallbacks =
    save: (rawDesign, sourceDesign) ->
      req = Api.Pervino.Design.create rawDesign, sourceDesign, user_id
      req.done (data) ->
        callback data

  new IframeModalLauncher('/components/create_design', props, routineCallbacks, modalSettings)


EditDesign = (source_design_id, user_id, callback) ->
  props =
    design_id: source_design_id
    lablrSettings:
      admin: true

  modalSettings =
    modalClasses: 'modal-lg'
    modalStyles: {height: "670px"}
  
  routineCallbacks =
    save: (rawDesign, sourceDesign) ->
      req = Api.Pervino.Design.update source_design_id, rawDesign
      req.done (data) ->
        callback data

  new IframeModalLauncher('/components/create_design', props, routineCallbacks, modalSettings)

@Routine =
  CreateDesign: CreateDesign
  SelectDesign: SelectDesign
  EditDesign: EditDesign
