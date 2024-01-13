import axios from 'axios';
import moment from 'moment';
import { PrimeIcons } from 'primereact/api';
import { Badge } from 'primereact/badge';
import { Button } from 'primereact/button';
import { Card } from 'primereact/card';
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import { Panel } from 'primereact/panel'
import React, { useEffect, useRef } from 'react'
import { useState } from 'react';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { Dropdown } from 'primereact/dropdown';
import swal from 'sweetalert';
import { Toast } from 'primereact/toast';
import { ColorPicker } from 'primereact/colorpicker';




function CreateProduct() {

    const [product, setProduct] = useState([]);
    const [loading, setloading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [removevisible, setremove] = useState(false);
    const [removeData, setremoveData] = useState({
        id: "",
        product: "",
        indicator: "",
        price: "",
        title: "",
        status: "",
    });
    const [color, setColor] = useState([]);
    const toast = useRef();
    const [Unit, setUnit] = useState([]);
    const [AddItem, setAddItem] = useState({
        product_name: "",
        product_price: "",
        error: [],
    });

    useEffect(() => {
        getProduct();
    }, []);


    const getProduct = () => {
        axios.get(`/api/GetProduct`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.data);
            }
            setloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }


    const statusBodyTemplate = (product) => {
        return (
            <>
                {
                    product.type_of_quantity === 1 ? <Badge severity={'info'} value={"Per Kilo"} /> : <Badge severity={'success'} value={"Per Pieces"} />
                }
            </>
        )
    }

    const CreatedFormat = (product) => {
        return (
            <>
                {
                    moment(product.created_at).format('MMM DD YYYY')
                }
            </>
        )
    }

    const PriceFormat = (product) => {
        return (
            <>
                ₱{product.product_price.toFixed(2)}
            </>
        )
    }

    const ActionButton = (product) => {
        return (
            <>
                <div className="d-flex">
                    <Button className=' me-2 p-button-sm p-button-info' onClick={RemoveItem} data-indicator={1} data-product={product.product_name} data-price={product.product_price} data-id={product.id} label='Edit' />
                    <Button className={`me-2 p-button-sm ${product.status === 0 ? 'p-button-success' : 'p-button-danger'}`} onClick={RemoveItem} data-indicator={2} data-product={product.product_name} data-status={product.status} data-id={product.id} label={product.status === 0 ? "Activate" : "Deactivite"} />
                </div>
            </>
        )
    }

    const handleInputupdate = (e) => {
        e.persist();
        setremoveData({...removeData, [e.target.name] : e.target.value})
    }

    const RemoveItem = (e) => {
        const id = e.currentTarget.getAttribute('data-id');
        const name = e.currentTarget.getAttribute('data-product');
        setremove(true)
        setremoveData({
            id: id,
            name: name,
            indicator: e.currentTarget.getAttribute('data-indicator'),
            price: e.currentTarget.getAttribute('data-price'),
            status: e.currentTarget.getAttribute('data-status'),
        });

    }
    const onHide = () => {
        setremove(false);
    }

    const AddProduct = () => {
        setVisible(true)
    }

    const header = () => {
        return (
            <div className="d-flex justify-content-end">
                <Button className='p-button-sm p-button-info' label='Add Product' onClick={AddProduct} icon={PrimeIcons.PLUS} />
            </div>
        )
    }

    const handleInput = (e) => {
        e.persist();
        setAddItem({ ...AddItem, [e.target.name]: e.target.value });
    }

    const AddProductData = (e) => {
        e.preventDefault();

        const data = {
            name: AddItem.product_name,
            price: AddItem.product_price,
            UnitType: Unit,
            color: color,
        };

        axios.post(`/api/CreateProduct`, data).then(res => {
            if (res.data.status === 200) {
                toast.current.show({ severity: "success", summary: "Product", details: "Added" })
                setVisible(false);
                getProduct();
            }
            else {
                setAddItem({ ...AddItem, error: res.data.error });
            }
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }


    const RemoveItemData = (e) => {
        e.preventDefault();

        const data = {
            id: removeData.id,
            status: removeData.status == 0 ? 1 : 0,
        }

        axios.put(`/api/DeleteItem`,data).then(res => {
            if (res.data.status === 200) {
                getProduct();
                toast.current.show({ severity: "success", summary: "Data has been removed", detail: "Removed Item" });
                setremove(false);
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }

    const UpdateDataProduct =  (e) => {
        e.preventDefault();
        const data = removeData;
        axios.put(`/api/UpdateProduct`,data).then(res => {
            if(res.data.status === 200){
                toast.current.show({severity: "success", summary: "Data has been updated", detail: "Successfully"});
                setremove(false);
                getProduct();
                document.getElementById('form_product').reset();
            }
            else{

            }
        }).catch((error) => {
            if(error.response.status === 500){

            }
        })
    }

    const StatusProduct = (product) => {
        return (
            <>
                {
                    product.status === 1 ? <Badge severity={'success'} value={'Active'} /> : <Badge severity={'danger'} value={'Not Active'} />
                }
            </>
        )
    }

    const unit = [
        { label: "Per Kilo", value: 1 },
        { label: "Per Pieces", value: 2 },
    ];


    return (
        <div className='container-fluid'>
            <Toast ref={toast} />
            <Card title="Product List">
                <DataTable sortMode='multiple' editMode='cell' value={product} header={header} paginator paginatorLeft rows={10} loading={loading}>
                    <Column field='product_name' sortable header="Product Name"></Column>
                    <Column field='product_price' sortable body={PriceFormat} header="Product Price"></Column>
                    <Column field='product_name' sortable body={statusBodyTemplate} header="Per Unit"></Column>
                    <Column field='status' sortable body={StatusProduct} header="Product Status"></Column>
                    <Column field='created_at' sortable body={CreatedFormat} header="Date Created"></Column>
                    <Column field='id' sortable body={ActionButton} header="Action"></Column>
                    <Column rowEditor headerStyle={{ width: '10%', minWidth: '8rem' }} bodyStyle={{ textAlign: 'center' }}></Column>
                </DataTable>
            </Card>
            <Dialog header="Add Product" position='top' draggable={false} visible={visible} onHide={() => setVisible(false)}
                style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }}>
                <form onSubmit={AddProductData}>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Name
                                </label>
                                <InputText className='w-100' name='product_name' onChange={handleInput} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Product Price
                                </label>
                                <InputText keyfilter={'money'} className='w-100' name='product_price' onChange={handleInput} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Per Unit
                                </label>
                                <Dropdown className='w-100' value={Unit} options={unit} placeholder='Choose Unit' onChange={(e) => setUnit(e.target.value)} />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Color Code Product
                                </label>
                                {color}
                                <ColorPicker className='w-100' value={color} onChange={(e) => setColor(e.value)} />
                            </div>
                            <div className="mt-3 d-flex justify-content-end">
                                <Button className='p-button-sm p-button-info' label='Create Product' />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>


            <Dialog draggable={false} position='top' header={removeData.name} visible={removevisible} onHide={onHide} breakpoints={{ '960px': '75vw', '640px': '100vw' }} style={{ width: '50vw' }}>
                {
                    removeData.indicator == 1 ? <>
                        <form onSubmit={UpdateDataProduct} id='form_product'>
                            <div className="row">
                                <div className="col-lg-12 mb-2">
                                    <label htmlFor="" className="form-label">
                                        Product Name
                                    </label>
                                    <InputText className='p-inputtext-sm ' onChange={handleInputupdate} name='name' value={removeData.name} />
                                </div>
                                <div className="col-lg-12 mb-2">
                                    <label htmlFor="" className="form-label">
                                        Product Price
                                    </label>
                                    <InputText className='p-inputtext-sm ' onChange={handleInputupdate} name='price' value={removeData.price} />
                                </div>
                                <div className="mt-3 d-flex justify-content-end">
                                    <Button className='p-button-success p-button-sm' label='Update Data'/>
                                </div>
                            </div>
                        </form>
                    </> : <>
                        Are you sure you want to {removeData.status === 1 ? 'Deactivate' : 'Activate'}  this {removeData.name} ?

                        <form onSubmit={RemoveItemData}>
                            <div className="d-flex justify-content-end">
                                <Button className={`p-button-sm  ${removeData.status == 1 ? 'p-button-danger' : 'p-button-success'}`} label={removeData.status == 1 ? 'Deactivate' : 'Activate'} icon={removeData.status == 1 ? PrimeIcons.TRASH : PrimeIcons.PLUS} />
                            </div>
                        </form>
                    </>
                }
            </Dialog>
        </div>
    )
}

export default CreateProduct