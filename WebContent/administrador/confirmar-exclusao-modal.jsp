    <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">x</span>
                        </button>
                        <h3 class="modal-title">Exclusão</h3>
                    </div>
                    <div class="modal-body">
                        <p>Tem certeza que deseja excluir o MotoTaxista?</p>
                    </div>
                    <div class="modal-footer">
                     <a href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=deletar&cod=${x.codMotoTaxista}"
                            class="btn btn-primary">Excluir</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>