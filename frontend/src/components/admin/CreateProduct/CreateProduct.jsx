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


function CreateProduct() {

    const [product, setProduct] = useState([]);
    const [loading, setloading] = useState(true);
    const [visible, setVisible] = useState(false);
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
        setAddItem({...AddItem, [e.target.name] : e.target.value});
    }

    const AddProductData = (e) => {
        e.preventDefault();

        const data = {
            name: AddItem.product_name,
            price: AddItem.product_price,
            UnitType: Unit,
        };

        axios.post(`/api/CreateProduct`,data).then(res => {
            if(res.data.status === 200) {
                toast.current.show({severity: "success", summary: "Product", details: "Added"})
                setVisible(false);
                getProduct();
            }
            else{
                setAddItem({...AddItem, error: res.data.error});
            }
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }

    const unit = [
        {label: "Per Kilo", value: 1},
        {label: "Per Pieces", value: 2},
    ];


    return (
        <div className='container-fluid'>
            <Toast ref={toast} />
            <Card title="Product List">
                <DataTable sortMode='multiple' editMode='cell' value={product} header={header} paginator paginatorLeft rows={10} loading={loading}>
                    <Column field='product_name' sortable header="Product Name"></Column>
                    <Column field='product_price' sortable body={PriceFormat} header="Product Price"></Column>
                    <Column field='product_name' sortable body={statusBodyTemplate} header="Per Unit"></Column>
                    <Column field='created_at' sortable body={CreatedFormat} header="Date Created"></Column>
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
                                <div className="mt-3 d-flex justify-content-end">
                                    <Button className='p-button-sm p-button-info' label='Create Product' />
                                </div>
                            </div>
                        </div>
                    </form>
            </Dialog>
        </div>
    )
}

export default CreateProduct