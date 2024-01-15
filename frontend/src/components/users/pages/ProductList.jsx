import axios from 'axios'
import moment from 'moment'
import { Button } from 'primereact/button'
import { Panel } from 'primereact/panel'
import { Skeleton } from 'primereact/skeleton'
import { Tag } from 'primereact/tag'
import { Toast } from 'primereact/toast'
import React, { useEffect, useRef, useState } from 'react'
import { Link, useHistory } from 'react-router-dom/cjs/react-router-dom.min'
import swal from 'sweetalert'
import { DataTable } from 'primereact/datatable'
import { Column } from 'primereact/column'
import { Dialog } from 'primereact/dialog'
import { Card } from 'primereact/card'
import ProductDetails from './ProductDetails'
import { Badge } from 'primereact/badge'

function ProductList() {

    const history = useHistory();
    const [loading, setloading] = useState(true);
    const [Product, setProduct] = useState([]);
    const [Details, setDetails] = useState([]);
    const [visible, setVisible] = useState(false);
    const toast = useRef();

    useEffect(() => {
        const id = localStorage.getItem('auth_id');
        axios.get(`/api/ProductDetails/${id}`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.product);
            }
            else {

            }
            setloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
                history.push(`/user/dashboard`);
            }
        })
    }, []);

    const product_status_data = (Product) => {
        return (
            <>
                {Product.price_status === 0 ? <Tag severity={'danger'} value='Selling' /> : <Tag severity={'success'} value='Sold' />}
            </>
        )
    }

    const DisplayData = (e) => {
        setDetails(e.currentTarget.getAttribute('data-uniq-key'));
        setVisible(true);
    }


    const product_action = (Product) => {
        return (
            <>
                <Button className='p-button-sm p-button-info' label='Details' onClick={DisplayData} data-uniq-key={Product.uniq_key} />
            </>
        )
    }

    const PriceFormat = (Product) => {
        return(
            <>
                ₱<span>{Product.product_price.toFixed(2)}</span>
            </>
        )
    }

    const PriceUnit = (Product) => {
        return (
            <>
                {
                    Product.price_unit === 1 ? <Badge className='p-badge' value={'Per Kilo'} /> : <Badge className='' value={'Per Pieces'} />
                }
            </>
        )
    }


    return (
        <>
            <Toast ref={toast} />
            <div className="container-fluid p-3">
                <div className="row">
                    <Card title="My Product">
                        <div className="d-flex justify-content-end mb-3">
                        </div>
                        <DataTable value={Product} paginator rows={10} loading={loading} paginatorLeft>
                            <Column field='name' header="Product Name"></Column>
                            <Column field='product_price' body={PriceFormat} header="Product Price"></Column>
                            <Column field='price_status' body={product_status_data} header="Status"></Column>
                            <Column field='price_unit' body={PriceUnit} header="Price Unit"></Column>
                            <Column field='uniq_key' body={product_action} header="Action"></Column>
                        </DataTable>
                    </Card>
                </div>
            </div>
            <Dialog header="Details" position='top' draggable={false} visible={visible} onHide={() => setVisible(false)}
                style={{ width: '100%' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }}>
                <ProductDetails data={Details} />
            </Dialog>

        </>
    )
}

export default ProductList